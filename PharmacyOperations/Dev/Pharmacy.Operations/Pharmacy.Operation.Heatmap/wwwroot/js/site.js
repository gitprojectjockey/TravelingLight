

$(document).ready();
{

    if (typeof jQuery !== 'undefined') {
        //Version?
        //alert(jQuery.fn.jquery);
    }

    //if (navigator.userAgent.match(/msie|trident/i)) {
    //    alert('I am Internet Explorer');
    //}

  

    $('#map').hide();
    $('#loading-div-background').show();

    function showCommBreakdownMessage() {
       
        var msg = $('#DataServiceErrorMessage').val();
        $(':button').prop('disabled', true);
        $('#loading-div-background').hide();
        $('#errorMessage').text(msg);
        $('#validationError').show('fade');
    }

    var map, heatmap, mapPoints = [], mapSettings, heatmapSettings = {};

    function refreshMap() {
        $('#map').slideUp(10);
        initMap();
        showMap();
        $('#map').slideDown(1400);
    }

    function showMap() {
        $('#loading-div-background').hide();
        $('#map').show();
    }

    function initMap() {

        $('#loading-div-background').show();
        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 5,
            center: { lat: 39.89288, lng: -98.434 },
            mapTypeId: 'hybrid',
        });

        heatmap = new google.maps.visualization.HeatmapLayer({
            data: getPoints(),
            map: map,
            radius: 20
        });

        var lastSelectedSettings = getSettings();
        heatmapSettings = lastSelectedSettings;
        if (lastSelectedSettings == null) {

            changeGradient('GREEN');
            changeRadius('LARGE');
            changeOpacity('HAZY-OPAQUE');
        }
        else {
            changeGradient(lastSelectedSettings.gradientType);
            changeRadius(lastSelectedSettings.radius);
            changeOpacity(lastSelectedSettings.opacity);
        }
    }

    function changeGradient(lastSelectedGradient) {

        var gradient;
        if ($('#SelectedGradient').val() == '') {
            $('#SelectedGradient').val('GREEN');
        }
        if (lastSelectedGradient != null) {
            if (lastSelectedGradient === 'BLUE') {

                gradient = [
                    'rgba(0, 255, 255, 0)',
                    'rgba(0, 255, 255, 1)',
                    'rgba(0, 191, 255, 1)',
                    'rgba(0, 127, 255, 1)',
                    'rgba(0, 63, 255, 1)',
                    'rgba(0, 0, 255, 1)',
                    'rgba(0, 0, 223, 1)',
                    'rgba(0, 0, 191, 1)',
                    'rgba(0, 0, 159, 1)',
                    'rgba(0, 0, 127, 1)',
                    'rgba(63, 0, 91, 1)',
                    'rgba(127, 0, 63, 1)',
                    'rgba(191, 0, 31, 1)',
                    'rgba(255, 0, 0, 1)'
                ]
                $('#SelectedGradient').val('GREEN');
            }
            else {
                gradient = null;
                $('#SelectedGradient').val('BLUE');
            }

            heatmap.set('gradient', gradient);
            return
        }

        if ($('#SelectedGradient').val() == 'BLUE') {

            gradient = [
                'rgba(0, 255, 255, 0)',
                'rgba(0, 255, 255, 1)',
                'rgba(0, 191, 255, 1)',
                'rgba(0, 127, 255, 1)',
                'rgba(0, 63, 255, 1)',
                'rgba(0, 0, 255, 1)',
                'rgba(0, 0, 223, 1)',
                'rgba(0, 0, 191, 1)',
                'rgba(0, 0, 159, 1)',
                'rgba(0, 0, 127, 1)',
                'rgba(63, 0, 91, 1)',
                'rgba(127, 0, 63, 1)',
                'rgba(191, 0, 31, 1)',
                'rgba(255, 0, 0, 1)'
            ]
            $('#SelectedGradient').val('GREEN');
            heatmapSettings.gradientType = 'BLUE';
            setSettings();
        }
        else {
            gradient = null;
            $('#SelectedGradient').val('BLUE');
            heatmapSettings.gradientType = 'GREEN';
            setSettings();
        }

        heatmap.set('gradient', gradient);
    }

    function changeRadius(lastSelectedRadius) {
        var radius;
        if ($('#SelectedRadius').val() == '') {
            $('#SelectedRadius').val('LARGE');
        }
        if (lastSelectedRadius != null) {
            if (lastSelectedRadius === 'LARGE') {
                radius = 20;
                $('#SelectedRadius').val('SMALL');
            }
            else {
                radius = 10;
                $('#SelectedRadius').val('LARGE');
            }

            heatmap.set('radius',radius);
            return
        }

        if ($('#SelectedRadius').val() == 'LARGE') {

            radius = 20;
            $('#SelectedRadius').val('SMALL');
            heatmapSettings.radius = 'LARGE';
            setSettings();
        }
        else {
            radius = 10;
            $('#SelectedRadius').val('LARGE');
            heatmapSettings.radius = 'SMALL';
            setSettings();
        }

        heatmap.set('radius', radius);
    }

    function changeOpacity(lastSelectedOpacity) {
       
        var opacity;
        if ($('#SelectedOpacity').val() == '') {
            $('#SelectedOpacity').val('HAZY-OPAQUE');
        }
        if (lastSelectedOpacity != null) {
            if (lastSelectedOpacity === 'HAZY-OPAQUE') {
                opacity = null;
                $('#SelectedOpacity').val('HAZY-TRANS');
            }
            else {
                opacity = 0.2;
                $('#SelectedOpacity').val('HAZY-OPAQUE');
            }

            heatmap.set('opacity', opacity);
            return
        }

        if ($('#SelectedOpacity').val() == 'HAZY-OPAQUE') {

            opacity = null;
            $('#SelectedOpacity').val('HAZY-TRANS');
            heatmapSettings.opacity = 'HAZY-OPAQUE';
            setSettings();
        }
        else {
            opacity = 0.2;
            $('#SelectedOpacity').val('HAZY-OPAQUE');
            heatmapSettings.opacity = 'HAZY-TRANS';
            setSettings();
        }

        heatmap.set('opacity', opacity);
    }

    function getPoints() {
        var uri = 'home/GetGeoData';
        $.ajax({
            method: 'GET',
            url: uri,
            contentType: 'application/json',
            dataType: "json",
            success: function (data) {
                $.each(data, function (index, value) {
                    mapPoints.push(new google.maps.LatLng(value.latitude, value.longitude));
                });
            },
            error: function (jqXHR) {
                $('#DataServiceErrorMessage').val('Error calling Geo Data Service at...' + uri + ' : ' +
                    jqXHR.status + ' ' +
                    jqXHR.statusText + ' ' +
                    JSON.stringify(jqXHR.responseJSON));

                showCommBreakdownMessage();
            }
        });

        return mapPoints;
    }

    function getSettings() {
        var uri = 'home/GetMapSettings';
        $.getJSON({
            method: 'GET',
            url: uri,
            cache: false,
            contentType: 'application/json',
            dataType: "json",
            success: function (data) {
                mapSettings = data;
            },
            error: function (jqXHR) {
                $('#errorMessage').text(uri + ' ' + jqXHR.status + ' ' + jqXHR.responseText + ' ' + jqXHR.statusText);
                $('#validationError').show('fade');
            }
        });

        return mapSettings;
    }

    function setSettings() {

        var heatmapSettingsDTO = JSON.stringify(heatmapSettings);

        var uri = 'home/SetMapSettings';
        $.getJSON({
            method: 'POST',
            cache: false,
            url: uri,
            contentType: 'application/json; charset=utf-8',
            dataType: "json",
            data: heatmapSettingsDTO,
            success: function (data) {
                mapSettings = data;
            },
            error: function (jqXHR) {
                $('#errorMessage').text(uri + ' ' + jqXHR.status + ' ' + jqXHR.responseText + ' ' + jqXHR.statusText);
                $('#validationError').show('fade');
            }
        });

        return mapSettings;
    }

    $(document).ready(function () {

        if (navigator.userAgent.match(/chrom(e|ium)/i) == null) {
            $('#robotVideos').hide();
        }
        else
        {
            $('#robotVideosDisabled').hide();
        }

        var dataServiceFound = $('#GeoDataService-Found').val();
       
        if (dataServiceFound === 'F') {
            return;
        }

        setTimeout(function () { initMap(); }, 2000);
        setTimeout(function () { showMap(); }, 5000);

        var count = 30;
        setInterval(function () {
            count--;
            if (count === 0) {
                count = 30;
                refreshMap();
            }

        }, 60000);

        $('#menu-icon').mouseover(function () {
            $('#div-nav-buttons').addClass('div-nav-buttons-show');
            $('#div-nav-buttons').removeClass('div-nav-buttons-hide');
        });

        $('#nav-container').hover(function () {
            $('#div-nav-buttons').removeClass('div-nav-buttons-show');
            $('#div-nav-buttons').addClass('div-nav-buttons-hide');
        });

        $('#div-nav-buttons').mouseover(function () {
            $('#div-nav-buttons').addClass('div-nav-buttons-show');
            $('#div-nav-buttons').removeClass('div-nav-buttons-hide');
        });

        $('#div-nav-buttons').mouseout(function () {
            $('#div-nav-buttons').removeClass('div-nav-buttons-show');
            $('#div-nav-buttons').addClass('div-nav-buttons-hide');
        });

        $('#linkCollapseValidationError').click(function () {
            $('#validationError').hide('fade');
        });
    });
}
