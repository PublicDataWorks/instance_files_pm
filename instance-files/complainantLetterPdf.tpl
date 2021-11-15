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
            {{recipientFirstName}}<br/>
            {{{formatLongDate currentDate}}}<br/>
            Page \{{page}}
        </div>

        <div id="pageFooter" style="text-align: center; margin-top: 16px">
            <span  style="display:inline-block; margin: 6px 16px 0 0">
                {{{generateImage "icon.ico" "max-width: 30px"}}}
            </span>
            <span style="display:inline-block; font-size:7pt; color: #7F7F7F;">
                OFFICE OF THE POLICE MONITOR <br />
                966 Morningview Lane | Grenville, WI | 53540 <br />
                Phone (641) 892-7222| Fax (414) 335-3049
            </span>
            <span  style="display:inline-block; width: 46px">&nbsp;</span>
        </div>
        <p style="color: #7F7F7F;">
            JOHN A SIMMS
            <br/>
            POLICE MONITOR
        </p>
        <p><br/></p>
        <p>
        {{{formatLongDate currentDate}}}
        </p>
        <p><br/></p>
        {{#if (isCivilianComplainant complainantPersonType)}}
        <p>
            {{recipientFirstName}} {{recipientLastName}}
                {{#if (isPresent (formatAddress complainantAddress))}}
                <p>{{{formatAddress complainantAddress}}}</p>
                {{/if}}
            {{#if (isPresent complainantEmail)}}
                <p>{{complainantEmail}}</p>
            {{/if}}
        </p>
        {{/if}}
        <p><br/></p>
        <p>Re: PM Complaint# {{caseReference}}</p>
        <p><br/></p>
        <p>Dear {{title}} {{recipientFirstName}} {{recipientLastName}}</p>
        <p><br/></p>
        <p>
            On {{{formatLongDate firstContactDate}}}, you contacted the Office of the Police Monitor
            (PM) alleging possible misconduct by an officer of the Grenville City Police
            Department (GCPD or Department) for possible violations of several GCPD rules. As a
            result of your contact with us, PM No. {{caseReference}} was generated.
        </p>
        <p><br/></p>
        <p>
            Among other things, the PM takes complaints and examines the GCPD’s internal investigations system by conducting independent reviews of completed investigations into allegations of misconduct to determine whether they have been conducted appropriately. The PM does not conduct separate or new investigations.
        </p>

        <p><br/></p>
        <p>We forwarded the information you provided us to the GCPD’s Public Governance Bureau
            (PGB) as an inquiry and asked that the matter be reviewed for possible violations of the
            GCPD rules and regulations. You may be contacted by a representative of PGB or by an
            GCPD supervisor regarding this matter.</p>
        <p><br/></p>
        <p>Please take into consideration that facts and/or allegations from your complaint may be
            used in future PM reports. If facts and/or allegations are used in future PM
            reports, names of witnesses, law enforcement, and complainants may be included. Once
            the review of your investigation has been completed, all or parts of the complaint may
            become public records.</p>
        <p><br/></p>
        <p>Enclosed you will find a copy of the PM letter to PGB and some information about
            our office. If you have any questions regarding the status of the information you
            provided, please contact us at (641) 892-7222 or via email at
            policemonitor@pm.ex. Please refer to your PM No. {{caseReference}} when you
            contact our office.</p>
        <p><br/></p>
        <p><br/></p>
        Sincerely,
        <p><br></p>
        {{{generateImage "nina_s_ambroise.png" "max-height: 55px"}}}
        <p><br/></p>
        Nina S Ambroise,
        <br/>
        Complaint Intake Consultant
    </body>
</html>
