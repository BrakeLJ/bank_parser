require 'csv'

CATEGORIES = {
  'Groceries' => ['walmart', 'costco', 'superstore', 'whole foods', 'grocery'],
  'Dining' => ['restaurant', 'mcdonald', 'starbucks', 'dining', 'cafe'],
  'Entertainment' => ['netflix', 'spotify', 'theater', 'cinema', 'concert'],
  'Utilities' => ['hydro', 'electric', 'internet', 'bell', 'rogers'],
  'Transport' => ['uber', 'lyft', 'gas', 'shell', 'esso'],
  'Uncategorized' => []
}

def categorize(description)
  puts description
  description = description.downcase

  # If the description matches any of the category mapping keywords return that category, otherwise return Uncategorized.
  # TODO What if the description matches multiple categories?
  CATEGORIES.each do |category, keywords|
    return category if keywords.any? { |word| description.include?(word)}
  end
  'Uncategorized'
end

def analyze_statement(file)
  transactions = []

  CSV.foreach(file, headers: true) do |row| 
    date = row['Date']
    description = row['Description']
    amount = row['Amount'].to_f
    category = categorize(description)
    puts row['date']

    transactions << {date: date, description: description, amount: amount}

    # Call a method to output a report to the console.
  end
end

analyze_statement('statement.csv')