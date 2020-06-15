table 90468 "BH Document Header"
{
    fields
    {
        field(1; "No."; Code[20])
        {
            trigger OnValidate();
            begin
                IF "No." <> xRec."No." THEN begin
                    ExampleSetup.GET;
                    NoSeriesManagement.TestManual(ExampleSetup."Document Nos.");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Document Date"; Date) { }
        field(3; "No. Series"; Code[20]) { }
        field(10; "Posting Date"; Date) { CaptionML = ENU = 'Posting Date'; }
        field(13; "No. Printed"; Integer)
        {
            CaptionML = ENU = 'No. Printed';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
    }
    trigger OnInsert();
    begin
        IF "No." = '' THEN BEGIN
            ExampleSetup.GET;
            ExampleSetup.TESTFIELD("Document Nos.");
            NoSeriesManagement.InitSeries(ExampleSetup."Document Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        END;
        InitRecord;
    end;

    var
        NoSeriesManagement: Codeunit 396;
        ExampleSetup: Record "BH Example Setup";
        DocumentHeader: Record "BH Document Header";
        DocumentLine: Record "BH Document Line";

    PROCEDURE AssistEdit(OldDocumentHeader: Record "BH Document Header"):
Boolean;
    var
        DocumentHeader: Record "BH Document Header";
    begin
        WITH DocumentHeader DO BEGIN
            DocumentHeader := Rec;
            ExampleSetup.GET;
            ExampleSetup.TESTFIELD("Document Nos.");
            IF NoSeriesManagement.SelectSeries(ExampleSetup."Document Nos.", OldDocumentHeader."No. Series", "No. Series") THEN BEGIN
                NoSeriesManagement.SetSeries("No.");
                Rec := DocumentHeader;
                EXIT(TRUE);
            END;
        END;
    end;

    PROCEDURE InitRecord();
    begin
        IF "Posting Date" = 0D THEN
            "Posting Date" := WORKDATE;
        "Document Date" := WORKDATE;
        ExampleSetup.GET;
    end;
}