    function HeaderCheckBoxClick(checkbox)
    {
        var gridView = document.getElementById("GridView1");
        for (i = 1; i < gridView.rows.length; i++)
        {
            gridView.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked
                = checkbox.checked;
        }
    }

    function ChildCheckBoxClick(checkbox) {
        var atleastOneCheckBoxUnchecked = false;
        var gridView = document.getElementById("GridView1");

        for (i = 1; i < gridView.rows.length; i++) {
            if (gridView.rows[i].cells[0].getElementsByTagName("INPUT")[0].checked
                    == false) {
                atleastOneCheckBoxUnchecked = true;
                break;
            }
        }

        gridView.rows[0].cells[0].getElementsByTagName("INPUT")[0].checked
            = !atleastOneCheckBoxUnchecked;
    }
}