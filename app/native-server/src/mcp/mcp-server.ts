import { Server } from '@modelcontextprotocol/sdk/server/index.js';
import { setupTools } from './register-tools';

export let mcpServer: Server | null = null;

export const getMcpServer = () => {
  if (mcpServer) {
    return mcpServer;
  }
  mcpServer = createMcpServer();
  return mcpServer;
};

/**
 * Create a fresh MCP Server instance.
 * Each Streamable HTTP session needs its own Server instance because the
 * MCP SDK's Protocol base class binds one-to-one with a transport — calling
 * `connect()` on an already-connected instance throws.
 */
export const createMcpServer = (): Server => {
  const pkgVersion = require('../../package.json').version || '1.0.0';
  const server = new Server(
    {
      name: 'H88ChromeMcpServer',
      version: pkgVersion,
    },
    {
      capabilities: {
        tools: {},
      },
    },
  );

  setupTools(server);
  return server;
};
