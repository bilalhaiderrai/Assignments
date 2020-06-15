query 90405 "BH Top 10 Customer"
{
    QueryType = Normal;
    OrderBy = descending(SumAmount__LCY_);
    TopNumberOfRows = 10;
    elements
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.") { }
            column(Name; Name) { }
            column(Customer_Posting_Group; "Customer Posting Group") { }

            dataitem(Cust__Ledger_Entry; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;
                DataItemTableFilter = "Document Type" = filter(Invoice | "Credit Memo");

                column(SumAmount__LCY_; "Amount (LCY)") { Method = Sum; }
            }
        }

    }

    var
        myInt: Integer;

    trigger OnBeforeOpen()
    begin

    end;
}
