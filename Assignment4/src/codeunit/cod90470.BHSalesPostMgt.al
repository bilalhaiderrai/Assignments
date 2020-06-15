codeunit 90470 "BH SalesPostMngt"
{
    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterCheckSalesDoc', '', true, true)]
    local procedure MyProcedure(CommitIsSuppressed: Boolean; var SalesHeader: Record "Sales Header")
    begin
        SalesHeader.testfield("My New Field");
    end;
}