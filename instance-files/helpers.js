export const generateSubjectLine = (caseReference, pibCaseNumber) => {
  if (pibCaseNumber) {
    return `Supplemental Referral; PM Complaint ${caseReference}; PIB Case ${pibCaseNumber}`;
  }
  return `Complaint Referral; PM Complaint ${caseReference}`;
};
