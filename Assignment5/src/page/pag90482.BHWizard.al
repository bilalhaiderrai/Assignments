page 90482 "Company Information Wizard"
{
    PageType = NavigatePage;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Company Information";

    layout
    {
        area(Content)
        {
            group(Step1)
            {
                group(CompanyName)
                {
                    Caption = 'Company Name';
                    field(Name; Name) { ApplicationArea = All; }
                }
            }
            group(Step2)
            {
                group(EmailAddress)
                {
                    Caption = 'Email';
                    field("E-Mail"; "E-Mail") { ApplicationArea = All; }
                }
            }
            group(Step3)
            {
                group(Alldone)
                {
                    Caption = 'All done';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionBack)
            {
                InFooterBar = true;
                Enabled = ActionBackAllowed;
                Image = PreviousRecord;
                trigger OnAction()

                begin
                    takestep(-1);
                end;
            }
            action(actionnext)
            {
                InFooterBar = true;
                Enabled = ActionNextAllowed;
                Image = NextRecord;
                trigger OnAction()

                begin
                    takestep(1);
                end;
            }
            action(actionfinish)
            {
                InFooterBar = true;
                Enabled = ActionFinishAllowed;
                Image = Approve;
                trigger OnAction()

                begin
                    CurrPage.Close();
                end;
            }
        }
    }
    procedure setcontrol()
    begin
        ActionBackAllowed := CurrentStep > 1;
        ActionNextAllowed := CurrentStep < 3;
        ActionFinishAllowed := CurrentStep = 3;
    end;

    procedure takestep(step: Integer)
    begin
        CurrentStep += Step;
        SetControl;
    end;

    trigger OnOpenPage()
    begin
        CurrentStep := 1;
        setcontrol();
    end;

    var
        CurrentStep: Integer;
        ActionNextAllowed: Boolean;
        ActionBackAllowed: Boolean;
        ActionFinishAllowed: Boolean;
}