extends Control

var image_path = 'res://image.png'
var quit_image = preload("res://quit_button.png")
var thumbnail_size = Vector2(1280, 720)
var text = 'Texto'
var image = null 
var saved : bool = false
export var centertext = Vector2(250,300)
var previous_label = null
var arial : bool = false
var impact : bool = true
var geologica : bool = false
var outline_enabled : bool = false
var black : bool = false
var label = null
var label_created : bool = false
var font = null
func _ready():

	var line_edit = LineEdit.new()
	line_edit.set_name('LineEdit') 
	line_edit.set_size(Vector2(200, 30))
	line_edit.set_position(Vector2(100, 100))
	add_child(line_edit)

	var button = Button.new()
	button.set_name('Button') 
	button.set_text('Load Image')
	button.set_size(Vector2(50, 30))
	button.set_position(Vector2(310, 100))
	add_child(button)
	button.connect('pressed', self, '_on_button_pressed', [line_edit])

	var save_button = Button.new()
	save_button.set_name('Button2') 
	save_button.set_text('Save')
	save_button.set_size(Vector2(100, 30))
	save_button.set_position(Vector2(100, 150))
	add_child(save_button)
	save_button.connect('pressed', self, '_on_save_button_pressed')
	
	#Enable Arial Font
	var font_arial_button = Button.new()
	font_arial_button.set_name('Button3')
	font_arial_button.set_text('Arial')
	font_arial_button.set_size(Vector2(100,30))
	font_arial_button.set_position(Vector2(1100,75))
	add_child(font_arial_button)
	font_arial_button.connect('pressed', self, '_on_font_arial_button_pressed')
	
	#Enable Impact Font
	var font_impact_button = Button.new()
	font_impact_button.set_name('Button4')
	font_impact_button.set_text('Impact')
	font_impact_button.set_size(Vector2(100,30))
	font_impact_button.set_position(Vector2(1100, 115))
	add_child(font_impact_button)
	font_impact_button.connect('pressed', self, '_on_font_impact_button_pressed')
	
	#Enable Geologica Font
	var font_geologica_button = Button.new()
	font_geologica_button.set_name('Button5')
	font_geologica_button.set_text('Geologica')
	font_geologica_button.set_size(Vector2(100,30))
	font_geologica_button.set_position(Vector2(1100, 155))
	add_child(font_geologica_button)
	font_geologica_button.connect('pressed', self, 'on_font_geologica_button_pressed')

	#check para poner trazos negros
	var check_button= CheckBox.new()
	check_button.set_name('CheckBox')
	check_button.set_text('Add Black Stroke')
	check_button.set_size(Vector2(100,30))
	check_button.set_position(Vector2(1100,400))
	add_child(check_button)
	check_button.connect('pressed', self, '_on_check_button_pressed')

	var check_button_color= CheckBox.new()
	check_button_color.set_name('CheckBox2')
	check_button_color.set_text('Black Text')
	check_button_color.set_size(Vector2(100,30))
	check_button_color.set_position(Vector2(1100,450))
	add_child(check_button_color)
	check_button_color.connect('pressed', self, '_on_check_button2_pressed')
	
	var exit_button = TextureButton.new()
	exit_button.set_name('Exit')
	exit_button.texture_normal = quit_image
	exit_button.set_size(Vector2(20,20))
	exit_button.set_position(Vector2(1200,10))
	add_child(exit_button)
	exit_button.connect('pressed', self, '_on_exit_button_pressed')
	
	var left_arrow = Button.new()
	left_arrow.set_name('left')
	left_arrow.set_text('<-')
	left_arrow.set_size(Vector2(40,40))
	left_arrow.set_position(Vector2(170,340))
	add_child(left_arrow)
	left_arrow.connect('pressed', self, '_on_left_arrow_pressed')
	
	var right_arrow = Button.new()
	right_arrow.set_name('right')
	right_arrow.set_text('->')
	right_arrow.set_size(Vector2(40,40))
	right_arrow.set_position(Vector2(270,340))
	add_child(right_arrow)
	right_arrow.connect('pressed', self, '_on_right_arrow_pressed')
	
	var up_arrow = Button.new()
	up_arrow.set_name ('up')
	up_arrow.set_text('^')
	up_arrow.set_size(Vector2(40,40))
	up_arrow.set_position(Vector2(220,290))
	add_child(up_arrow)
	up_arrow.connect('pressed', self, '_on_up_arrow_pressed')
	
	var down_arrow = Button.new()
	down_arrow.set_name('down')
	down_arrow.set_text('v')
	down_arrow.set_size(Vector2(40,40))
	down_arrow.set_position(Vector2(220,340))
	add_child(down_arrow)
	down_arrow.connect('pressed', self, '_on_down_arrow_pressed')
	
	var scale_up = Button.new()
	scale_up.set_name ('scale_up')
	scale_up.set_text('+')
	scale_up.set_size(Vector2(50,50))
	scale_up.set_position(Vector2(1030,600))
	add_child(scale_up)
	scale_up.connect('pressed', self, '_on_scale_up_button_pressed')
	
	var scale_down = Button.new()
	scale_down.set_name ('scale_down')
	scale_down.set_text('-')
	scale_down.set_size(Vector2(50,50))
	scale_down.set_position(Vector2(1100,600))
	add_child(scale_down)
	scale_down.connect('pressed', self, '_on_scale_down_button_pressed')

func _on_scale_up_button_pressed():
	if label_created:
		font.size += 3
	pass
	
	
func _on_scale_down_button_pressed():
	if label_created:
		font.size -=3
	pass
		
	
	
func _update_text():
	label.set_position(centertext)
	if outline_enabled:
			font.outline_size = 2 
			font.outline_color = Color.black 
	else:
			font.outline_size = 0
			font.outline_color = Color.black 
	if black:
		label.add_color_override('font_color', Color.black)
	else:
		label.add_color_override('font_color', Color.white)
	if arial:
		font.font_data = load("res://arial.ttf") 
	if impact:
		font.font_data = load('res://unicode.impact.ttf') 
	if geologica:
		font.font_data = load("res://Geologica.ttf") 
		pass
	
func _on_exit_button_pressed():
	get_tree().quit()

func _on_check_button2_pressed():
		if black == false:
			black = true
		elif black == true:
			black = false
		if label_created == true:
			_update_text()	
	

func _on_down_arrow_pressed():
	if label_created == true:
		centertext.y += 30
		_update_text()
	pass
	
func _on_up_arrow_pressed():
	if label_created == true:
		centertext.y -= 30
		_update_text()
	pass
	
func _on_right_arrow_pressed():
	if label_created == true:
		centertext.x += 30
		_update_text()
	pass
	
func _on_left_arrow_pressed():
	if label_created == true:
		centertext.x -= 30
		_update_text()
	pass

func _on_check_button_pressed():
	if outline_enabled == false:
		outline_enabled = true
		
	elif outline_enabled == true:
		outline_enabled = false
	if label_created == true:
		_update_text()
	

func _on_font_impact_button_pressed():
	arial = false
	impact = true
	geologica = false
	if label_created == true:
		_update_text()

func _on_font_arial_button_pressed():
	arial = true
	impact = false
	geologica = false
	if label_created == true:
		_update_text()
	
func on_font_geologica_button_pressed():
	geologica =true
	arial = false
	impact = false
	if label_created == true:
		_update_text()

func _on_button_pressed(line_edit):
	text = line_edit.get_text()
	create_thumbnail()

func create_thumbnail():
	var file_dialog = FileDialog.new()
	file_dialog.set_size(Vector2(500, 400))
	file_dialog.connect('file_selected', self, '_on_file_selected')
	file_dialog.set_access(FileDialog.ACCESS_FILESYSTEM)
	file_dialog.set_mode(FileDialog.MODE_OPEN_FILE)
	file_dialog.add_filter('*.png ; PNG Images')
	file_dialog.add_filter('*.jpg ; JPEG Images')
	add_child(file_dialog)
	file_dialog.popup_centered()

func _on_file_selected(path):
	image_path = path
	update_thumbnail()

func update_thumbnail():
	var file = File.new()
	file.open(image_path, File.READ)
	var buffer = file.get_buffer(file.get_len())
	file.close()
	image = Image.new() 
	image.load_jpg_from_buffer(buffer)
	image.load_png_from_buffer(buffer)
	image.resize(thumbnail_size.x, thumbnail_size.y)
	var texture_rect = get_node('TextureRect')
	texture_rect.texture = ImageTexture.new()
	texture_rect.texture.create_from_image(image)
	if previous_label != null:
		previous_label.queue_free()


	label = Label.new()
	label_created = true

	add_child(label)
	label.set_text(text)
	label.set_position((thumbnail_size)/2)
	label.set_position(centertext)
	label.anchor_left =140.0
	label.anchor_left =440.0
	previous_label = label
	

	# Crea una fuente dinámica
	if impact == true:
		font = DynamicFont.new()
		font.font_data = load('res://unicode.impact.ttf') 
		font.size = 55
		if outline_enabled == true:
			font.outline_size = 2 
			font.outline_color = Color.black 
		if black == true:
			label.add_color_override('font_color', Color.black)
		label.add_font_override('font', font)
		label.set_position(centertext)
		label.add_color_override('font_outline_modulate', Color.black)
		label.add_constant_override('outline_size', 230)
		label.add_constant_override('outline_color', 102)

	if arial == true:
		font = DynamicFont.new()
		font.font_data = load("res://arial.ttf") 
		font.size = 55
		if outline_enabled == true:
			font.outline_size = 2 
			font.outline_color = Color.black 
		if black == true:
			label.add_color_override('font_color', Color.black)
		label.add_font_override('font', font)
		label.set_position(centertext)
		label.add_color_override('font_outline_modulate', Color.black)
		label.add_constant_override('outline_size', 230)
		label.add_constant_override('outline_color', 102)
		
	if geologica == true:
		var font = DynamicFont.new()
		font.font_data = load("res://Geologica.ttf") 
		font.size = 55
		if outline_enabled == true:
			font.outline_size = 2 
			font.outline_color = Color.black 
		if black == true:
			label.add_color_override('font_color', Color.black)
		label.add_font_override('font', font)
		label.set_position(centertext)
		label.add_color_override('font_outline_modulate', Color.black)
		label.add_constant_override('outline_size', 230)
		label.add_constant_override('outline_color', 102)
		
		
func save_thumbnail():
	get_node('Button').queue_free()
	get_node('Button2').queue_free()
	get_node('LineEdit').queue_free()
	get_node('Button3').queue_free()
	get_node('Button4').queue_free()
	get_node('CheckBox').queue_free()
	get_node('Button5').queue_free()
	get_node('CheckBox2').queue_free()
	get_node('Exit').queue_free()
	get_node('up').queue_free()
	get_node('down').queue_free()
	get_node('right').queue_free()
	get_node('left').queue_free()
	get_node('scale_up').queue_free()
	get_node('scale_down').queue_free()
	
	
	yield(get_tree().create_timer(1),"timeout")


	var texture = get_viewport().get_texture()
	image = texture.get_data() 
	image.flip_y()


		
	var file_dialog = FileDialog.new()
	file_dialog.set_size(Vector2(50, 400))
	file_dialog.connect('file_selected', self, '_on_save_file_selected')
	file_dialog.set_access(FileDialog.ACCESS_FILESYSTEM)
	file_dialog.set_mode(FileDialog.MODE_SAVE_FILE)
	file_dialog.set_current_file('miniatura.png')
	add_child(file_dialog)
	file_dialog.popup_centered()
	file_dialog.connect('popup_hide', self, '_on_file_dialog_closed')

func _on_file_dialog_closed():
	saved = true


func _on_save_file_selected(path):
	image.save_png(path)
	
func _on_save_button_pressed():
	get_node('Button').hide()
	get_node('Button2').hide()
	get_node('LineEdit').hide()
	save_thumbnail()



func _process(delta):
	if saved == true:
		yield(get_tree().create_timer(1),"timeout")
		get_tree().quit()
