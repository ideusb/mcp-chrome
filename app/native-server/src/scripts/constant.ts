import fs from 'fs';
import path from 'path';
import os from 'os';

export const COMMAND_NAME = 'h88-chrome-mcp-bridge';
/**
 * Official Chrome Web Store extension ID.
 * This is the deterministic ID produced when the extension is signed with the official key.
 */
export const EXTENSION_ID = 'ilhlbjgpmlkddakmglmiglgpgmjhmjeh';
/**
 * Default built-in key extension ID.
 * This is the deterministic ID produced by the default key in wxt.config.ts
 * when no CHROME_EXTENSION_KEY environment variable is set.
 * This covers users who build the extension from source without the official key.
 */
export const DEFAULT_KEY_EXTENSION_ID = 'mglgdclcbpgmmolcmnainfhdofolgodh';
export const HOST_NAME = 'com.chromemcp.nativehost';
export const DESCRIPTION = 'Node.js Host for Browser Bridge Extension';

/**
 * Environment variable to specify additional extension IDs.
 * Users can set this to a comma-separated list of extension IDs.
 * Example: CHROME_MCP_EXTENSION_ID=ebkkkadahhknklfblpdddjmdkbhpihfl,otherid
 */
export const EXTENSION_ID_ENV = 'CHROME_MCP_EXTENSION_ID';

/**
 * Filename for persisted extra extension IDs.
 */
export const EXTRA_IDS_FILENAME = 'extra_extension_ids.json';

/**
 * Get the user-data directory for h88-chrome-mcp-bridge.
 * This directory survives npm reinstalls (unlike dist/).
 *
 * - Windows: %LOCALAPPDATA%/h88-chrome-mcp-bridge
 * - macOS:   ~/Library/Application Support/h88-chrome-mcp-bridge
 * - Linux:   $XDG_DATA_HOME/h88-chrome-mcp-bridge  (or ~/.local/share/h88-chrome-mcp-bridge)
 */
export function getUserDataDir(): string {
  const platform = os.platform();
  if (platform === 'win32') {
    return path.join(
      process.env.LOCALAPPDATA || path.join(os.homedir(), 'AppData', 'Local'),
      'h88-chrome-mcp-bridge',
    );
  } else if (platform === 'darwin') {
    return path.join(os.homedir(), 'Library', 'Application Support', 'h88-chrome-mcp-bridge');
  } else {
    const xdgData = process.env.XDG_DATA_HOME || path.join(os.homedir(), '.local', 'share');
    return path.join(xdgData, 'h88-chrome-mcp-bridge');
  }
}

/**
 * Get the full path to the extra extension IDs file.
 */
export function getExtraIdsFilePath(): string {
  return path.join(getUserDataDir(), EXTRA_IDS_FILENAME);
}

/**
 * Validate that a string looks like a Chrome extension ID.
 */
function isValidExtensionId(id: string): boolean {
  return typeof id === 'string' && /^[a-z]{32}$/.test(id);
}

/**
 * Collect all extension IDs that should be included in allowed_origins.
 * Priority: official ID + environment variable IDs + persisted extra IDs + caller-supplied IDs.
 * Duplicates are automatically removed.
 */
export function getAllExtensionIds(extraIds?: string[]): string[] {
  const ids = new Set<string>();

  // Always include the official extension ID
  ids.add(EXTENSION_ID);

  // Always include the default key extension ID (source builds without CHROME_EXTENSION_KEY)
  ids.add(DEFAULT_KEY_EXTENSION_ID);

  // Add IDs from environment variable
  const envIds = process.env[EXTENSION_ID_ENV];
  if (envIds) {
    for (const id of envIds.split(',')) {
      const trimmed = id.trim();
      if (trimmed && isValidExtensionId(trimmed)) {
        ids.add(trimmed);
      }
    }
  }

  // Add IDs from persisted file (user data directory — survives reinstalls)
  try {
    const filePath = getExtraIdsFilePath();
    if (fs.existsSync(filePath)) {
      const data = JSON.parse(fs.readFileSync(filePath, 'utf8'));
      if (Array.isArray(data)) {
        for (const id of data) {
          if (isValidExtensionId(id)) {
            ids.add(id);
          }
        }
      }
    }
  } catch {
    // Ignore file read errors
  }

  // Legacy: also check old location (dist/../extra_extension_ids.json) and migrate
  try {
    const legacyPath = path.join(__dirname, '..', EXTRA_IDS_FILENAME);
    if (fs.existsSync(legacyPath)) {
      const data = JSON.parse(fs.readFileSync(legacyPath, 'utf8'));
      if (Array.isArray(data)) {
        const migrated: string[] = [];
        for (const id of data) {
          if (isValidExtensionId(id)) {
            ids.add(id);
            migrated.push(id);
          }
        }
        // Migrate to new location and remove old file
        if (migrated.length > 0) {
          saveExtraExtensionIds(migrated);
        }
        try { fs.unlinkSync(legacyPath); } catch { /* ignore */ }
      }
    }
  } catch {
    // Ignore
  }

  // Add caller-supplied IDs
  if (extraIds) {
    for (const id of extraIds) {
      const trimmed = id.trim();
      if (trimmed && isValidExtensionId(trimmed)) {
        ids.add(trimmed);
      }
    }
  }

  return Array.from(ids);
}

/**
 * Save extra extension IDs to the persisted file in user data directory.
 * Merges with any existing IDs. The official ID is not persisted (always included).
 */
export function saveExtraExtensionIds(ids: string[]): void {
  const filePath = getExtraIdsFilePath();
  const valid = ids.filter(id => isValidExtensionId(id.trim())).map(id => id.trim());
  // Merge with existing IDs
  const existing = new Set<string>();
  try {
    if (fs.existsSync(filePath)) {
      const data = JSON.parse(fs.readFileSync(filePath, 'utf8'));
      if (Array.isArray(data)) {
        for (const id of data) {
          if (isValidExtensionId(id)) {
            existing.add(id);
          }
        }
      }
    }
  } catch {
    // Ignore
  }
  for (const id of valid) {
    existing.add(id);
  }
  // Don't persist the official ID (it's always included)
  existing.delete(EXTENSION_ID);
  // Ensure directory exists
  const dir = path.dirname(filePath);
  fs.mkdirSync(dir, { recursive: true });
  fs.writeFileSync(filePath, JSON.stringify(Array.from(existing), null, 2), 'utf8');
}
