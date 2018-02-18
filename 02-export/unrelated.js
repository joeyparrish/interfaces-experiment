/**
 * Copyright 2018 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

goog.provide('unrelated');

/**
 * @constructor
 * Implements the same method name as iface, but does not implement it.
 * This allows us to check if renaming affects all instances of a name.
 */
unrelated = function() {};

/**
 * @param {number} bar
 * @return {string}
 */
unrelated.prototype.foo = function(bar) {
  return (bar * bar * bar).toString();
};
