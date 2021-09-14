/**
 * PersonType class - used to represent the various types of person (meant to be read only)
 *
 * @param {Object} input - an object with the distinguishing information about the type.
 *                          Fields:
 *                          - description: the string that describes the person type
 *                          - employeeDescription (optional): the string that the describes the employee type (null/undefined if not an employee)
 *                          - abbreviation: the abbreviation to use for this person type in case reference id, etc. (limit three characters)
 *                          - complainantLegendValue: the text that will be used on a legend of complainants for this type of person
 *                          - publicLegendValue: the text that will be used within the public data dashboard (optional: defaults to complainantLegendValue)
 */
function PersonType(input) {
  this._desc = input.description;
  this._empDesc = input.employeeDescription;
  this._abbrev = input.abbreviation;
  this._legend = input.complainantLegendValue;
  this._publicLegend = input.publicLegendValue;
}

Object.defineProperty(PersonType.prototype, "description", {
  get: function description() {
    return this._desc;
  },
});

Object.defineProperty(PersonType.prototype, "employeeDescription", {
  get: function employeeDescription() {
    return this._empDesc;
  },
});

Object.defineProperty(PersonType.prototype, "abbreviation", {
  get: function abbreviation() {
    return this._abbrev;
  },
});

Object.defineProperty(PersonType.prototype, "isEmployee", {
  get: function isEmployee() {
    return !!this._empDesc;
  },
});

Object.defineProperty(PersonType.prototype, "complainantLegendValue", {
  get: function complainantLegendValue() {
    return this._legend;
  },
});

Object.defineProperty(PersonType.prototype, "publicLegendValue", {
  get: function publicLegendValue() {
    return this._publicLegend || this._legend;
  },
});

module.exports = PersonType;
