page 90480 "BH Sales Invoice Cue Card"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BH Sales Invoice Cue";

    layout
    {
        area(Content)
        {
            cuegroup("Sales Invoices")
            {
                Caption = 'Sales Invoices';
                field("Sales Invoices Open"; "Sales Invoices Open")
                {
                    ApplicationArea = All;
                    Caption = 'Open';
                    DrillDownPageId = "Sales Invoice List";
                }
                field("Sales this month"; "Sales this month")
                {
                    ApplicationArea = All;
                    Caption = 'Sales this month';
                    DrillDownPageId = "Customer Ledger Entries";
                    AutoFormatType = 10;
                    AutoFormatExpression = 'kr <precision,0:0><standard format,0>';
                }
            }

        }
    }
    actions
    {
        area(Processing)
        {
            action("New Sales Invoice")
            {
                ApplicationArea = All;
                RunPageMode = Create;
                RunObject = page "Sales Invoice";
            }
        }
    }
    trigger OnOpenPage()
    begin
        Reset;
        If not Get then begin
            Init;
            Insert;
        end;
    end;

    trigger OnAftergetRecord()
    var
        myInt: Integer;
    begin
        "Sales this month" := CalcSalesThisMonthAmount();
    end;
}


