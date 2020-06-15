page 90420 "BH Customer Overview"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BH Customer Overview";
    Caption = 'Customer Overview';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("Entry No"; "Entry No")
                {
                    ApplicationArea = All;
                }
                field("Customer No"; "Customer No")
                {
                    ApplicationArea = All;
                }
                field("Customer Name"; "Customer Name")
                {
                    ApplicationArea = All;
                }
                field("Source Code"; "Source Code")
                {
                    ApplicationArea = All;
                }
                field("Amount"; "Amount")
                {
                    ApplicationArea = All;
                }
                field("Last Run Date"; LastRunDate)
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Import records")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    UpdateCustomerOverview.Run();
                end;

            }
        }
    }

    var
        UpdateCustomerOverview: Codeunit "BH Update Customer Overview";
}