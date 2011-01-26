require 'rubygems'

require 'sinatra'
require 'erb'
require 'yaml'

require 'rdiscount'


module Walter
  
  class App < Sinatra::Base
    set :title, "fragments"

    get "/css/benjamin.css" do
      less :benjamin
    end

    get "/" do
      file_index = Dir.glob('quotes/*.txt')
  
      @books = file_index.map do |f|
          Book.new f
      end
  
      erb :index
    end

    get "/quotes/:name" do

      b = Book.new "quotes/"+params[:name]+".txt"
      b.load_quotes

      @book = b

      erb :book
    end
  end

  class Book
    attr_accessor :file, :bib, :title, :author, :quotes
  
    def initialize( f )
      @quotes = Array.new
      @file = f
    
      self.load_bib
    end
  
    def load_bib
      file_content = File.read @file
      header = file_content.split(/---\n/, 1)[0]

      @bib = YAML.load(header)

      @title = @bib['title']
    
      if @bib['author']
        @author = @bib['author'].map do |a|
          Author.new a['first'], a['last'], a['middle'], a['lineage']
        end
      else
        @author = [ Author.new "John", "Doe", "", ""]
      end
    end
  
    def load_quotes
      file_content = File.read @file
      parts = file_content.split(/---\n/)
    
      parts.each do |part|
        meta, body = part.split(/\n\n/, 2)

        meta = YAML.load(meta)

        # skipping the first part if it is containing yaml that looks like
        # bibliographical information

        if(meta['title'])
        else
          self.add_quote meta['page'], body
        end
      end
    end
  
    def add_quote( p, b )
      @quotes.push Quote.new p,b
    end
  
    def by(k)
      if k == "author"
        self.sort_by { |b| b.author[0].last }
      end
    end

    def url
      @file.sub ".txt", ""
    end
  end

  class Quote
    attr_accessor :book, :page, :body
  
    def initialize page, body
      @page = page
      @body = body
    end
  
    def render
      RDiscount.new(@body).to_html
    end
  
    def page
      h = @page.to_s
      h.sub! "--", "&ndash;"
      h
    end
  end

  class Author
    attr_accessor :first, :middle, :last, :lineage
  
    def initialize f, l, m, li
      @first = f
      @middle = m
      @last = l
      @lineage = li
    end
  
    def to_html
      "#{@last}, #{@first}" 
    end
  end

  class Index
    attr_accessor :authors, :books
  end
end