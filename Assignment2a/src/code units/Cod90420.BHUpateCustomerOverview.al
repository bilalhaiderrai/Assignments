codeunit 90420 "BH Update Customer Overview"
{
    trigger OnRun()
    begin
        CLEAR(SourceCode);
        CLEAR(CustomerOverview);
        CLEAR(GLEntry);
        IF CustomerOverview.FINDLAST THEN
            NextEntryNo := CustomerOverview."Entry No" + 1
        ELSE
            NextEntryNo := 1;
        IF SourceCode.FINDSET THEN
            REPEAT
                IF Customer.FINDSET THEN
                    REPEAT
                        GLEntry.SETRANGE("Source Type", GLEntry."Source Type"::Customer);
                        GLEntry.SETRANGE("Source Code", SourceCode.Code);
                        GLEntry.SETRANGE("Source No.", Customer."No.");
                        IF GLEntry.FINDSET THEN BEGIN
                            GLEntry.CALCSUMS(GLEntry.Amount);
                            CustomerOverview."Entry No" := NextEntryNo;
                            CustomerOverview."Customer No" := Customer."No.";
                            CustomerOverview."Customer Name" := Customer.Name;
                            CustomerOverview."Source Code" := SourceCode.Code;
                            CustomerOverview.Amount := GLEntry.Amount;
                            CustomerOverview.LastRunDate := CURRENTDATETIME;
                            CustomerOverview.INSERT;
                            NextEntryNo += 1;
                        END;
                    UNTIL Customer.NEXT = 0;
            UNTIL SourceCode.NEXT = 0;
    end;

    var
        CustomerOverview: Record "BH Customer Overview";
        Customer: Record Customer;
        SourceCode: Record "Source Code";
        GLEntry: Record "G/L Entry";
        NextEntryNo: Integer;
}