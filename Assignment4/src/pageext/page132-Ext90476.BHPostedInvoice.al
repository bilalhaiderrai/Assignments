pageextension 90476 MySalesInvoiceExtension extends "Posted Sales Invoice"
{
    layout
    {
        addlast(General)
        {
            field("My New Field"; "My New Field") { ApplicationArea = All; }
        }
    }
}