import type { FastifyInstance } from 'fastify';
import healthRoutes from './health.js';

/** Registers all HTTP API plugins (health + feature routes). */
export async function registerRoutes(app: FastifyInstance): Promise<void> {
  await app.register(healthRoutes, { prefix: '/api' });
}
