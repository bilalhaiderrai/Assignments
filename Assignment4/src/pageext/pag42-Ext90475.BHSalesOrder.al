pageextension 90475 MySalesOrderExtension extends "Sales Order"
{
    Caption = 'Sales Order';
    layout
    {

        addlast(General)
        {
            field("My New Field"; "My New Field") { ApplicationArea = All; }
        }
    }
}