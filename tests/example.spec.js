const { test, expect } = require('@playwright/test');

 

test('example.com title', async ({ page }) => {
  await page.goto('https://example.com');
  await expect(page).toHaveTitle(/Example Domain/);
});

test('example.com content', async ({ page }) => {
  await page.goto('https://example.com');
  const text = await page.locator('h1').innerText();
  expect(text).toBe('Example Domain');
});
