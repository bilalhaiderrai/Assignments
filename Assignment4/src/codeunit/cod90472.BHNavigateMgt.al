codeunit 90472 "BH NavigateMngt"
{
    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Page, Page::Navigate, 'OnAfterNavigateFindRecords', '', true, true)]
    local procedure MyOnAfterNavigateFindRecords(DocNoFilter: Text; PostingDateFilter: Text; var DocumentEntry: Record "Document Entry")
    begin
        if SalesHeader.READPERMISSION then begin
            SalesHeader.RESET;
            SalesHeader.SETCURRENTKEY("No.", "Posting Date");
            SalesHeader.SETFILTER("No.", DocNoFilter);
            SalesHeader.SETFILTER("Posting Date", PostingDateFilter);
            if SalesHeader.COUNT = 0 then
                exit;
            DocumentEntry.INIT;
            DocumentEntry."Entry No." := DocumentEntry."Entry No." + 1;
            DocumentEntry."Table ID" := 36;
            DocumentEntry."Document Type" := DocumentEntry."Document Type"::Order;
            DocumentEntry."Table Name" := COPYSTR(SalesHeader.TABLECAPTION, 1, MAXSTRLEN(DocumentEntry."Table Name"));
            DocumentEntry."No. of Records" := SalesHeader.COUNT;
            DocumentEntry.INSERT;
        end;
    end;

    [EventSubscriber(ObjectType::Page, page::Navigate, 'OnAfterNavigateShowRecords', '', true, true)]
    local procedure MyOnAfterNavigateShowRecords(DocNoFilter: Text; TableID: Integer; PostingDateFilter: Text; ItemTrackingSearch: Boolean)
    begin
        if TableID = DATABASE::"Sales Header" then begin
            if SalesHeader.COUNT = 1 then
                PAGE.RUN(PAGE::"Sales Order", SalesHeader)
            else
                PAGE.RUN(0, SalesHeader);
        end;
    end;

    var
        SalesHeader: Record "Sales Header";
}