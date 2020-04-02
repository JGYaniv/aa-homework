def all_words_capitalized?(words)
  words.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
  domains = %w(com net io org)
  urls.none? do |url|
    domain = url.split(".").last
    domains.include?(domain)
  end
end

def any_passing_students?(students)
  students.any? do |student|
    student[:grades].sum / student[:grades].length >= 75
  end
end