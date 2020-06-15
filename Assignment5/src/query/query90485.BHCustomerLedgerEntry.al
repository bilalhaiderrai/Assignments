query 90485 "BH Customer Ledger Entry"
{
    QueryType = Normal;
    elements
    {
        dataitem(Cust__Ledger_Entry; "Cust. Ledger Entry")
        {
            filter(Document_Type; "Document Type") { }
            filter(Posting_Date; "Posting Date") { }
            column(Sum_Sales_LCY; "Sales (LCY)") { Method = Sum; }
        }
    }
}