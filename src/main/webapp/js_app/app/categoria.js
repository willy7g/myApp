$(document).ready(function () {

    //empieza la funcion de abrir modal
    $('#btnAbrirNCategoria').click(function () {
      // $('#txtIdCategoriaER').val("");
        $('#txtNombreCategoriaER').val("");
      $('.error-validation').fadeOut();
        $('#actionCategoria').val("addCategoria");
        $('#tituloModalManCategoria').html("REGISTRAR CATEGORIA"); //es el titulo del modal le pasamos el titulos
        $('#ventanaModalManCategoria').modal('show'); // hace que se abra el modal

    });

//busca al momento de dar click en buscar sin actualizar la pag
    $('#FrmCategoria').submit(function () {
        $('#actionCategoria').val("paginarCategoria");
        $('#nameFormCategoria').val("FrmCategoria");
        $('#numberPageCategoryia').val("1");
        $('#modalCargandoCategoria').modal("show");

        return false;
    });
    
    
    

   $('#FrmCategoriaModal').submit(function () {
        if (validarFormularioCategoria()) {
            $('#nameFormCategoria').val("FrmCategoriaModal");
            $('#modalCargandoCategoria').modal('show');
        }
        return false;
    });



//trae todos los datos
    // processAjaxCategoria();

    //esto modal servira para que se pueda a brir una barrita como si estuviera cargadno luego muestra todo loq ue proceso AJAX
    $("#modalCargandoCategoria").on('shown.bs.modal', function () {
        processAjaxCategoria();
    });



    addEventoCombosPaginar();
    addValicacionesCamposCategoria();
    
    //ESTA PARTA llamamos lo que abrira la barrita de qcomo si etuviera cargando
    $('#modalCargandoCategoria').modal('show');

});


function addEventosCategoria() {
   
    
    $('.editar-Categoria').each(function () {
        $(this).click(function () {
            $('#txtIdCategoriaER').val($(this.parentElement.parentElement).attr('idcategoria'));
            $('#txtNombreCategoriaER').val($(this.parentElement.parentElement).attr('nombre'));
            $('#actionCategoria').val("updateCategoria");
            $('#tituloModalManCategoria').html("EDITAR CATEGORIA");
            $('#ventanaModalManCategoria').modal("show");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    
    
    $('.eliminar-Categoria').each(function () {
        $(this).click(function () {
            $('#txtIdCategoriaER').val($(this.parentElement.parentElement).attr('idcategoria'));
            viewAlertDelete("Categoria");
            document.getElementsByTagName("body")[0].style.paddingRight = "0";
        });
    });
    
    
    
}







//funcion pra mostrar los datos de categoria
function processAjaxCategoria() {
    var datosSerializadosCompletos = $('#' + $('#nameFormCategoria').val()).serialize(); //trae los datos que llenamos en html
    if ($('#nameFormCategoria').val().toLowerCase() !== "frmcategoria") {
        datosSerializadosCompletos += "&txtNombreCategoria=" + $('#txtNombreCategoria').val();
    }
    datosSerializadosCompletos += "&numberPageCategoria=" + $('#numberPageCategoria').val();
    datosSerializadosCompletos += "&sizePageCategoria=" + $('#sizePageCategoria').val();
    datosSerializadosCompletos += "&action=" + $('#actionCategoria').val();

    $.ajax({
        url: '/myapp/categorias',
        type: 'POST',
        data: datosSerializadosCompletos,
        dataType: 'json',
        success: function (jsonResponse) {
            $('#modalCargandoCategoria').modal("hide");// con esta linea cerramos la barrita de modal
            
             if ($('#actionCategoria').val().toLowerCase() === "paginarcategoria") {
                listarCategoria(jsonResponse.BEAN_PAGINATION);
            } else {
                if (jsonResponse.MESSAGE_SERVER.toLowerCase() === "ok") {
                    $("#ventanaModalManCategoria").modal("hide");
                    listarCategoria(jsonResponse.BEAN_PAGINATION);
                    viewAlert('success','Operacion Con Exito');
                    
                    
                } else {
                    viewAlert('warning', jsonResponse.MESSAGE_SERVER);
                }
            }
             console.log(jsonResponse);
           
        },
        error: function () {
            $('#modalCargandoCategoria').modal("hide");
            $("#ventanaModalManCategoria").modal("hide");
            viewAlert('error', 'Error interno en el Servidor');

        }
    });
    return false;
}



function listarCategoria(BEAN_PAGINATION) {
    /*PAGINATION*/
    var $pagination = $('#paginationCategoria');
    $pagination.twbsPagination('destroy');
    $('#tbodyCategoria').empty();
    $('#nameCrudCategoria').html("[" + BEAN_PAGINATION.COUNT_FILTER + "] Categorias");
    if (BEAN_PAGINATION.COUNT_FILTER > 0) {
        var fila;
        var atributos;
        $.each(BEAN_PAGINATION.LIST, function (index, value) {
            fila = "<tr ";
            atributos = "";
            atributos += "idcategoria='" + value.idcategoria + "' ";
            atributos += "nombre='" + value.nombre + "' ";
            fila += atributos;
            fila += ">";
            fila += "<td class='align-middle'>" + value.nombre + "</td>";
            fila += "<td class='text-center align-middle'><button class='btn btn-secondary btn-xs editar-Categoria'><i class='fa fa-edit'></i></button></td>";
            fila += "<td class='text-center align-middle'><button class='btn btn-secondary btn-xs eliminar-Categoria'><i class='fa fa-trash'></i></button></td>";
            fila += "</tr>";
            $('#tbodyCategoria').append(fila);
        });




        var defaultOptions = getDefaultOptionsPagination();

        var options = getOptionsPagination(BEAN_PAGINATION.COUNT_FILTER, $('#sizePageCategoria'),
                $('#numberPageCategoria'), $('#actionCategoria'), 'paginarCategoria',
                $('#nameForm'), 'FrmCategoria', $('#modalCargandoCategoria'));

        $pagination.twbsPagination($.extend({}, defaultOptions, options));
        addEventosCategoria()
        $('#txtNombreCategoria').focus();

    } else {
        console.log("error al cargar ultimo log");
        
        viewAlert('warning', 'No se enconntraron resultados'); //esto es loq ue se envia a otro lado pra mostrarlo d euna vez solo se envcia el tipo y el msja
        
        
        
        
    }
}






function addValicacionesCamposCategoria() {
    $('#txtNombreCategoriaER').on('change', function () {
        $(this).val() === "" ? $("#validarNombreCategoriaER").fadeIn("slow") : $("#validarNombreCategoriaER").fadeOut();
    });
}


function validarFormularioCategoria() {
    if ($('#txtNombreCategoriaER').val() === "") {
        $("#validarNombreCategoriaER").fadeIn("slow");
        return false;
    } else {
        $("#validarNombreCategoriaER").fadeOut();
    }
    return true;
}



