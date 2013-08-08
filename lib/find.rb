class Find < Action
  def self.Tag(agent, keywords, options)
    word = Find.MakeKeyword(keywords)
  end

  def self.Keyword(agent, keywords, options={})
    options[:word] = keywords.join(" ")
    params = Find.MakeParameter(options)
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
    const_opt = [:word, :tool, :ratio, :hgt, :wgt, :scd, :order, :s_mode]
    retval = []
    options.each{|opt, val|
      if const_opt.index(opt) == nil then
        raise Pixiv2::OptionNotFoundError, "not fond #{opt.to_s}"
      else
        retval << {opt, val}
      end
    }
  end
end