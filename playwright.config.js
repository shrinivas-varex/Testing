
import { defineConfig } from '@playwright/test';

export default defineConfig({
 

reporter: [
    ['list'],
    ['monocart-reporter', {
      name: 'Playwright Test Report',
      outputFile: './monocart-report/index.html'
    }]
  ],


  use: {
    trace: 'retain-on-failure',
    screenshot: 'only-on-failure',
    video: 'retain-on-failure'
  }
});
