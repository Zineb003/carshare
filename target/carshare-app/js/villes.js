$(document).ready(function () {
    $('#depart').select2({
        placeholder: 'Départ',
        allowClear: true,
        width: '100%',
        ajax: {
        url: '<%= request.getContextPath() %>/api/villes',
        dataType: 'json',
        delay: 250,
        data: function (params) {
            return {
            term: params.term
            };
        },
        processResults: function (data) {
            return {
            results: data
            };
        },
        cache: true
        },
        minimumInputLength: 1
    });
});