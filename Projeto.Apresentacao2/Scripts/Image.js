
function get_dados_inclusao() {
    return {
        Imagem: '',
    };
}

function get_dados_form() {
    var form = new FormData();
    form.append('Image', $('#Imagem').prop('files')[0]);
    return form;
}