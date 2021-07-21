export const generateSubjectLine = (caseReference, pgbCaseNumber) => {
  if (pgbCaseNumber) {
    return `Supplemental Referral; PM Complaint ${caseReference}; PGB Case ${pgbCaseNumber}`;
  }
  return `Complaint Referral; PM Complaint ${caseReference}`;
};
