
import { defineConfig } from '@playwright/test';

export default defineConfig({
 
 reporter: [
    ['html'],
    ['allure-playwright']
  ]

  use: {
    trace: 'retain-on-failure',
    screenshot: 'only-on-failure',
    video: 'retain-on-failure'
  }
});
