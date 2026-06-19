
import { defineConfig } from '@playwright/test';

export default defineConfig({
  reporter: [
    ['html'],
    ['list']
  ],

  use: {
    trace: 'retain-on-failure',
    screenshot: 'only-on-failure',
    video: 'retain-on-failure'
  }
});
