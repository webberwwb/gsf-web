#!/usr/bin/env node
/**
 * Script to add version hash to public asset URLs in index.html
 * This ensures cache busting for assets in /public folder
 */
import { readFileSync, writeFileSync, existsSync } from 'fs';
import { fileURLToPath } from 'url';
import { dirname, join } from 'path';
import { createHash } from 'crypto';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);

// Generate a version hash based on current timestamp and package version
const packageJson = JSON.parse(readFileSync(join(__dirname, 'package.json'), 'utf-8'));
const timestamp = Date.now();
const versionHash = createHash('md5')
  .update(`${packageJson.version}-${timestamp}`)
  .digest('hex')
  .substring(0, 8);

const indexPath = join(__dirname, 'dist', 'index.html');

try {
  // Check if dist/index.html exists
  if (!existsSync(indexPath)) {
    console.warn(`Warning: ${indexPath} not found, skipping version hash addition`);
    process.exit(0); // Don't fail the build
  }
  
  let html = readFileSync(indexPath, 'utf-8');
  
  // Add version query parameter to all public asset URLs
  // Match: /assets/... or /venobox/...
  html = html.replace(
    /(href|src)=["'](\/(?:assets|venobox)\/[^"']+)["']/g,
    (match, attr, url) => {
      // Skip if already has version parameter
      if (url.includes('?v=') || url.includes('&v=')) {
        return match;
      }
      const separator = url.includes('?') ? '&' : '?';
      return `${attr}="${url}${separator}v=${versionHash}"`;
    }
  );
  
  writeFileSync(indexPath, html, 'utf-8');
  console.log(`✓ Added version hash ${versionHash} to public assets in index.html`);
} catch (error) {
  console.warn(`Warning: Could not add version hash: ${error.message}`);
  // Don't fail the build - just warn
  process.exit(0);
}

