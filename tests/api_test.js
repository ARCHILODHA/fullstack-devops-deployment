const request = require('supertest');
const app = require('../backend/app');

describe('GET /', () => {
  it('should return success', async () => {
    const res = await request(app).get('/');
    expect(res.statusCode).toBe(200);
  });
});
