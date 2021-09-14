var PersonType = require("./PersonType");
var organization = "PM";
var pd = "GCPD";

module.exports = {
  ORGANIZATION: organization,
  ORGANIZATION_TITLE: "Office of the Police Monitor",
  CITY: "City of Grenville",
  PD: pd,
  BUREAU: "Public Governance Bureau",
  BUREAU_ACRONYM: "PGB",
  CIVILIAN_WITHIN_PD_NAME: "Civilian (" + pd + ") Name",
  CIVILIAN_WITHIN_PD_TITLE: "Civilian (" + pd + ")",
  CIVILIAN_WITHIN_PD_INITIATED: "Civilian Within " + pd + " Initiated",
  FIRST_CONTACTED_ORGANIZATION: "First Contacted " + organization,
  ADD_CIVILIAN_WITHIN_PD: "Add Civilian (" + pd + ")",
  SEARCH_CIVILIAN_WITHIN_PD: "Search for a Civilian (" + pd + ")",
  PERSON_TYPE: {
    CIVILIAN: new PersonType({
      description: "Civilian",
      abbreviation: "CC",
      complainantLegendValue: "Civilian (CC)",
    }),
    KNOWN_OFFICER: new PersonType({
      description: "Known Officer",
      employeeDescription: "Officer",
      abbreviation: "PO",
      complainantLegendValue: "Police Officer (PO)",
    }),
    UNKNOWN_OFFICER: new PersonType({
      description: "Unknown Officer",
      employeeDescription: "Officer",
      abbreviation: "PO",
      complainantLegendValue: "Police Officer (PO)",
    }),
    CIVILIAN_WITHIN_PD: new PersonType({
      description: "Civilian " + pd,
      employeeDescription: "Civilian Within " + pd,
      abbreviation: "CPD",
      complainantLegendValue: "Civilian Within " + pd + " (CPD)",
      publicLegendValue: "Civilian " + pd + " Employee (CPD)",
    }),
  },
};