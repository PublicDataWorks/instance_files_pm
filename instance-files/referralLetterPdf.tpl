<html>
  <head>
      <link rel="stylesheet" type="text/css" href="pdf.css">
  </head>
  <body>
    <div id="pageHeader-first">
      <div style="text-align: center;">
        <img style="max-width: 223px" src="file:/app/src/instance-files/images/header_text.png" />
      </div>
      <div style="text-align: center; margin-top: 8px">
        <img style="max-width: 42px" src="file:/app/src/instance-files/images/icon.ico" />
      </div>
    </div>
    <div id="pageHeader" style="font-size:8.5pt; color: #7F7F7F;">
      {{{recipient}}}<br/>
      {{{formatLongDate currentDate}}}<br/>
      Page \{{page}}
    </div>

    <div id="pageFooter" style="text-align: center; margin-top: 16px">
            <span  style="display:inline-block; margin: 6px 16px 0 0">
                <img style="max-width: 30px" src="file:/app/src/instance-files/images/icon.ico" />
            </span>
      <span style="display:inline-block; font-size:7pt; color: #7F7F7F;">
                OFFICE OF THE POLICE MONITOR<br />
                966 Morningview Lane | Grenville, WI | 53540 <br />
                Phone (641) 892-7222| Fax (414) 335-3049
            </span>
      <span  style="display:inline-block; width: 46px">&nbsp;</span>
    </div>
    <p style="color: #7F7F7F;">
      JOHN A SIMMS
      <br>
      POLICE MONITOR
    </p>
    <p><br></p>
    {{{formatLongDate currentDate}}}
    <p><br></p>
    {{{renderHtml recipient}}}</br>
    {{{renderHtml (newLineToLineBreak recipientAddress)}}}
    <p><br></p>
    <p><strong>RE: {{{ generateSubjectLine caseReference pgbCaseNumber}}}</strong></p>
    <p><br></p>
    <p>Dear {{{recipient}}}:</p>
    <p><br></p>
    {{{renderHtml letterBody}}}
    <p><br></p>
    Sincerely,
    <p><br></p>
    {{{generateSignature sender includeSignature}}}
    <p><br></p>
    {{{renderHtml (newLineToLineBreak sender)}}}
    {{#if transcribedBy}}
    <p><br></p>
    Transcribed by: {{transcribedBy}}
    {{/if}}
  </body>
</html>