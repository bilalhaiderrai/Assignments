pageextension 90471 "BH Item Card" extends "Item Card"
{
    Caption = 'Item Card';
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("Prepa&yment Percentages")
        {
            action(ImportItemPicture)
            {
                ApplicationArea = All;
                Caption = 'Import Item Picture';
                trigger OnAction()
                begin
                    ImageManagement.ImportItemPicture(Rec);
                end;
            }
            action(EportItemPicture)
            {
                ApplicationArea = All;
                Caption = 'Export Item Picture';
                trigger OnAction()
                begin
                    ImageManagement.ExportItemPicture(Rec);
                end;
            }
            action(ExporttoXML)
            {
                ApplicationArea = All;
                Caption = 'Export to XML';
                RunObject = xmlport "BH Customer Fixed";
            }
            action(ExporttCSVL)
            {
                ApplicationArea = All;
                Caption = 'Export to CSV';
                RunObject = xmlport "BH Customer Variable";
            }

        }
    }

    var
        ImageManagement: Codeunit "BH Image Management";
}