import { Server } from '@modelcontextprotocol/sdk/server/index.js';
import { setupTools } from './register-tools';

export let mcpServer: Server | null = null;

export const getMcpServer = () => {
  if (mcpServer) {
    return mcpServer;
  }
  const pkgVersion = require('../../package.json').version || '1.0.0';
  mcpServer = new Server(
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

  setupTools(mcpServer);
  return mcpServer;
};
