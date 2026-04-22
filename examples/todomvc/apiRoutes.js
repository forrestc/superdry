'use strict';

const cors = require('cors');
const bodyParser = require('body-parser');
const { merge, omit } = require('lodash');

const DEFAULT_ENTRIES = {
  1506184685750: { description: 'buy milk' },
  1506184685751: { description: 'buy cheese', completed: true }
};

let entries = { ...DEFAULT_ENTRIES };

module.exports = function setupRoutes(app) {
  app.use(cors());
  app.use(bodyParser.json());

  app.get('/entries', (req, res) => {
    res.json(Object.entries(entries).map(([id, entry]) => merge({}, entry, { id })));
  });

  app.patch('/entry/:id', (req, res) => {
    entries[req.params.id] = req.body;
    res.json({ status: 'ok' });
  });

  app.delete('/entry/:id', (req, res) => {
    delete entries[req.params.id];
    res.json({ status: 'ok' });
  });

  app.post('/entries', (req, res) => {
    const id = req.body.id;
    entries[id] = omit(req.body, 'id');
    res.json({ status: 'ok' });
  });
};
