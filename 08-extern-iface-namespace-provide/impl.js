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

goog.provide('mynamespace.impl');

/**
 * @param {string} prefix
 * @constructor
 * @implements {mynamespace.iface}
 * @export
 * Exported in all versions so that we can check for renaming on the prototype.
 */
mynamespace.impl = function(prefix) {
  /** @private {string} */
  this.prefix_ = prefix;
};

/**
 * @param {number} bar
 * @return {string}
 * @export
 * Exported to prevent inlining by the compiler, which would make it impossible
 * to check for renaming issues.
 */
mynamespace.impl.prototype.foo = function(bar) {
  return this.prefix_ + (bar * bar).toString();
};
