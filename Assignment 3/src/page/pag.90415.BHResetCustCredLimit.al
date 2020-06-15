page 90415 "BH Reset Credit Limit Page"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    trigger OnOpenPage()
    begin
        ResetCodeUnit.Run();
    end;

    var
        ResetCodeUnit: Codeunit "BH Reset Customer Credit Limit";
}