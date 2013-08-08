require "./lib/request.rb"

class Find < Request
  @@search = "search.php"

  #s_tag, s_tag_full, s_tc

  def self.MakeURL(type, keywords, options={})
    if keywords.class == Array then
      options[:word] = keywords.join(" ")
    elsif keywords.class == String then
      options[:word] = keywords
    else
      raise ArgumentError, "invalid argument: keywords => #{keywords}"
    end
    options[:s_mode] = type
    params = Find.MakeParameter(options)
    @@url + @@search + "?" + params
  end

  private
  def self.MakeParameter(options)
    Find.CheckSymbolOptions(options)
    opt_array = options.to_a
    params = []

    for i in 0..opt_array.length-1
      params << opt_array[i][0].to_s + "=" + opt_array[i][1]
    end
    params.join("&")
  end

  private
  def self.CheckSymbolOptions(options)
    const_opt = [:r18, :s_mode, :word, :tool, :ratio, :hgt, :wgt, :scd, :order, :s_mode]
    options.each{|opt, val|
      index = const_opt.index(opt)
      if index == nil then
        raise Pixiv2::OptionNotFoundError, "not fond #{opt.to_s}"
      end
    }
  end
end