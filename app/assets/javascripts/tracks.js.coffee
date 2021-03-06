# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
gm_init = ->
gm_center = new google.maps.LatLng(59.7838530, 5.2112377)
# gm_center = new google.maps.LatLng($("#map_canvas").data(‘track’).latitude, $("#map_canvas").data(‘track’).longitude)
gm_map_type = google.maps.MapTypeId.TERRAIN
map_options = {center: gm_center, zoom: 12, mapTypeId: gm_map_type}
new google.maps.Map(@map_canvas,map_options);

# Code seems to run fine up to this point
load_track = (id,map) ->
callback = (data) -> display_on_map(data,map)
$.get '/tracks/'+id+'.json', {}, callback, 'json'

display_on_map = (data,map) ->
decoded_path = google.maps.geometry.encoding.decodePath(data.polyline)
path_options = { path: decoded_path, strokeColor: "#FF0000", strokeOpacity: 0.5, strokeWeight: 5}
track_path = new google.maps.Polyline(path_options)
track_path.setMap(map)
map.fitBounds(calc_bounds(track_path));

calc_bounds = (track_path) ->
b = new google.maps.LatLngBounds()
gm_path = track_path.getPath()
path_length = gm_path.getLength()
i = [0,(path_length/3).toFixed(0),(path_length/3).toFixed(0)*2]
b.extend(gm_path.getAt(i[0]))
b.extend(gm_path.getAt(i[1]))
b.extend(gm_path.getAt(i[2]))


$ ->
map = gm_init()
load_track(js_track_id,map)
