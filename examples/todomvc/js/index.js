// Generated by CoffeeScript 2.0.1
var element;

import {
  get
} from 'lodash';

import React from 'react';

import reactKup from 'react-kup';

import {
  render
} from 'react-dom';

import {
  AppContainer
} from 'react-hot-loader';

import TodoMvc from './TodoMvc';

element = function() {
  return reactKup(function(k) {
    return k.build(AppContainer, function() {
      return k.div(function() {
        return k.build(TodoMvc);
      });
    });
  });
};

render(element(), document.getElementById('root'));
