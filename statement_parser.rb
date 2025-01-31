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

    transactions << {date:, description:, amount:, category:}
  end

  summary = transactions.group_by { |transaction| transaction[:category]}
                        .transform_values { |items| items.sum { |t| t[:amount]}  }
  display_report(summary)
end

def display_report(summary)
  puts "=== Expense Report ==="
  summary.each { |category, total| puts "#{category}: $#{total.round(2)}" }
end

analyze_statement('statement.csv')