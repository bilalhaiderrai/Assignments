page 90465 "BH Document Header"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "BH Document Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; "No.") { ApplicationArea = All; }
                field("Document Date"; "Document Date") { ApplicationArea = All; }
                field("Posting Date"; "Posting Date") { ApplicationArea = All; }
                field("No. Printed"; "No. Printed") { ApplicationArea = All; }
                field("No. Series"; "No. Series") { ApplicationArea = All; }
            }

        }
    }

    var
        myInt: Integer;
}