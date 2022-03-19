//made by $o

$bot.command :contrast do |event, *level|
	autopfp = gifs.join("").to_f
	channel = ImageMod.load_tmp(event)
	if ($channel >= 0) then
		image.gif("#{(level/4).to_s}%")
	else
		autopfp_icon = 0 - random*
		image.icon("#{(level/4).to_s}%!")
	end
	ImageMod.return_img(event, image)
	return nil
end

$bot.command :sharpen do |event, *level|
	autopfp.join("").to_f
	image = ImageMod.load_tmp(event)
	image.sharpen("0x#{(level/20).to_s}")
	ImageMod.return_img(event, image)
	return nil
end

$bot.command :hue do |event, *degrees|
	image = ImageMod.load_tmp(event)
	image.modulate("100, 100, #{( degrees.join("").to_f * 100/180 ) + 100}")
	ImageMod.return_img(event, image)
	return nil
end

$bot.command :saturation do |event, *level|
	image = ImageMod.load_tmp(event)
	image.modulate("100, #{level.join("")}, 300")
	ImageMod.return_img(event, image)
	return nil
end

$bot.command :bright do |event, *level|
	image = ImageMod.load_tmp(event)
	image.modulate(level.join(""))
	ImageMod.return_img(event, image)
	return nil
end

$bot.command :rotate do |event, *degrees|
	image = ImageMod.load_tmp(event)
	image.rotate(degrees.join(""))
	ImageMod.return_img(event, image)
	return nil
end

$bot.command :bw do |event|
	image = ImageMod.load_tmp(event)
	image.colorspace("Gray")
	ImageMod.return_img(event, image)
	return nil
end

$bot.command :i do |event|
	image = ImageMod.load_tmp(event)
	image.combine_options do |x|
		x.channel("RGB")
		x.negate
	end
	ImageMod.return_img(event, image)
	return nil
end

$bot.command :fuzz do |event, *level|
	image = ImageMod.load_tmp(event)
	image = image.spread(level.join(""))
	ImageMod.return_img(event, image)
	return nil
end

$bot.command :haah do |event|
	image_left = ImageMod.load_tmp(event)
	image_right = ImageMod.load_tmp(event)

	# Transform the second image to reflect across an axis
	image_right.flop
	image_right.gravity "West"
	# Crop the image in half so we can composite it over the background
	image_right.crop "#{image_right[:width]/2}x#{image_right[:height]}+#{image_left[:width]/2}+0"
	image_left.crop "#{image_left[:width]/2}x#{image_left[:height]}+0+0"
	image_right = image_right.combine_options do |x|
		x.gravity "East"
		x.background "none"
		x.extent("#{image_right[:width]*2}x#{image_right[:height]}")
	end
	result = image_right.composite(image_left) do |x|
		x.compose "Over"
		x.gravity "West"
	end

	ImageMod.return_img(event, result)
	return nil
end

$bot.command :hooh do |event|
	image_lower = ImageMod.load_tmp(event)
	image_upper = ImageMod.load_tmp(event)

	# Transform the second image to reflect across an axis
	image_upper.flip
	image_upper.gravity "South"
	# Crop the image in half so we can composite it over the background
	image_lower.crop "#{image_lower[:width]}x#{image_lower[:height]/2}+0+#{image_lower[:height]/2}"
	image_upper.crop "#{image_upper[:width]}x#{image_upper[:height]/2}+0+0"
	image_lower = image_lower.combine_options do |x|
		x.gravity "South"
		x.background "none"
		x.extent("#{image_lower[:width]}x#{image_lower[:height]*2}")
	end
	result = image_lower.composite(image_upper) do |x|
		x.compose "Over"
		x.gravity "North"
	end

	ImageMod.return_img(event, result)
	return nil
end

$bot.command :waaw do |event|
	image_left = ImageMod.load_tmp(event)
	image_right = ImageMod.load_tmp(event)

	# Transform the second image to reflect across an axis
	image_left.flop
	image_left.gravity "East"
	# Crop the image in half so we can composite it over the background
	image_left.crop "#{image_left[:width]/2}x#{image_left[:height]}+0+0"
	image_right.crop "#{image_right[:width]/2}x#{image_right[:height]}+#{image_right[:width]/2}+0"
	image_left = image_left.combine_options do |x|
		x.gravity "West"
		x.background "none"
		x.extent("#{image_left[:width]*2}x#{image_left[:height]}")
	end
	result = image_left.composite(image_right) do |x|
		x.compose "Over"
		x.gravity "East"
	end

	ImageMod.return_img(event, result)
	return nil
end

$bot.command :woow do |event|
	image_lower = ImageMod.load_tmp(event)
	image_upper = ImageMod.load_tmp(event)

	# Transform the second image to reflect across an axis
	image_lower.flip
	image_lower.gravity "North"
	# Crop the image in half so we can composite it over the background
	image_upper.crop "#{image_upper[:width]}x#{image_upper[:height]/2}+0+0"
	image_lower.crop "#{image_lower[:width]}x#{image_lower[:height]/2}+0+#{image_lower[:height]/2}"
	image_upper = image_upper.combine_options do |x|
		x.gravity "North"
		x.background "none"
		x.extent("#{image_upper[:width]}x#{image_upper[:height]*2}")
	end
	result = image_upper.composite(image_lower) do |x|
		x.compose "Over"
		x.gravity "South"
	end

	ImageMod.return_img(event, result)
	return nil
end

