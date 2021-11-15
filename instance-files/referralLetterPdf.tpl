<html>
  <head>
        <style>
            * {
                font-size: 8.5pt;
            }

            p {
                margin: 0;
            }

            .preserve-white-space {
                white-space: pre-wrap;
            }

            .ql-align-center {
                text-align: center;
            }
        </style>
  </head>
  <body>
    <div id="pageHeader-first">
      <div style="text-align: center;">
        {{{generateImage "header_text.png" "max-width: 223px"}}}
      </div>
      <div style="text-align: center; margin-top: 8px">
        {{{generateImage "icon.ico" "max-width: 42px"}}}
      </div>
    </div>
    <div id="pageHeader" style="font-size:8.5pt; color: #7F7F7F;">
      {{{recipient}}}<br/>
      {{{formatLongDate currentDate}}}<br/>
      Page \{{page}}
    </div>

    <div id="pageFooter" style="text-align: center; margin-top: 16px">
            <span  style="display:inline-block; margin: 6px 16px 0 0">
                {{{generateImage "icon.ico" "max-width: 30px"}}}
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