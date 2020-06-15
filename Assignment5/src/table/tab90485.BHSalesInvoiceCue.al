table 90485 "BH Sales Invoice Cue"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PrimaryKey; Code[10]) { DataClassification = ToBeClassified; }
        field(2; "Sales Invoices Open"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = Count ("Sales Header" WHERE("Document Type" = FILTER(Invoice), Status = FILTER(Open)));
        }
        field(3; "Sales this month"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; PrimaryKey)
        {
            Clustered = true;
        }
    }
    procedure CalcSalesThisMonthAmount() Amount: Decimal
    var
        CustLedgEntry: Record "Cust. Ledger Entry";
        CustLedgEntrySales: Query "BH Customer Ledger Entry";
    begin
        CustLedgEntrySales.SetRange(Document_Type, CustLedgEntry."Document Type"::Invoice);
        CustLedgEntrySales.SetRange(Posting_Date, CalcDate('<-CM>', Workdate), Workdate);
        CustLedgEntrySales.Open;
        if CustLedgEntrySales.Read then Amount := CustLedgEntrySales.Sum_Sales_LCY;
    end;

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}