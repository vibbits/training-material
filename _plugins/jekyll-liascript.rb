module Jekyll
  class LiaScriptConverter < Converter
    safe true
    priority :high

    def matches(ext)
      ext =~ /^\.md$/i
    end

    def output_ext(ext)
      ".md"
    end

    def convert(content)
      content.gsub(/-{,2}\{{2}[[[:alnum:]]@ ]*\}{2}-{,2}/, "") 
    end
  end
end
