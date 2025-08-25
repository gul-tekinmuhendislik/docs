#!/usr/bin/env python3
import os
import re

def get_description_from_content(content, title):
    """Generate a description from content or use default"""
    # Remove frontmatter if exists
    content_without_fm = re.sub(r'^---\n.*?\n---\n', '', content, flags=re.DOTALL)
    
    # Get first paragraph
    lines = content_without_fm.strip().split('\n')
    description_lines = []
    
    for line in lines:
        line = line.strip()
        if line and not line.startswith('#') and not line.startswith('<') and not line.startswith('-') and not line.startswith('*'):
            # Clean the line from markdown syntax
            clean_line = re.sub(r'\[([^\]]+)\]\([^\)]+\)', r'\1', line)  # Remove links
            clean_line = re.sub(r'[*_`]', '', clean_line)  # Remove formatting
            description_lines.append(clean_line)
            if len(' '.join(description_lines)) > 100:
                break
    
    if description_lines:
        description = ' '.join(description_lines)[:160]
        if len(description) > 157:
            description = description[:157] + '...'
        return description
    
    # Default descriptions based on title
    return f"{title} - Gül-tekin Mühendislik tarafından sunulan profesyonel hizmetler ve çözümler."

def add_meta_description(file_path):
    """Add meta description to MDX file if missing"""
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Check if file has frontmatter
    has_frontmatter = content.startswith('---\n')
    
    if has_frontmatter:
        # Check if description exists
        frontmatter_match = re.match(r'^---\n(.*?)\n---\n', content, re.DOTALL)
        if frontmatter_match:
            frontmatter = frontmatter_match.group(1)
            
            # Check if description already exists
            if 'description:' in frontmatter:
                print(f"✓ {file_path} - already has description")
                return False
            
            # Extract title
            title_match = re.search(r'title:\s*["\'](.*?)["\']', frontmatter)
            if not title_match:
                title_match = re.search(r'title:\s*(.*?)$', frontmatter, re.MULTILINE)
            
            title = title_match.group(1) if title_match else os.path.basename(file_path).replace('.mdx', '')
            
            # Generate description
            description = get_description_from_content(content, title)
            
            # Add description to frontmatter
            new_frontmatter = frontmatter + f'\ndescription: "{description}"'
            new_content = content.replace(frontmatter, new_frontmatter, 1)
            
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(new_content)
            
            print(f"✓ {file_path} - added description")
            return True
    else:
        # Extract title from first heading or filename
        title_match = re.search(r'^#\s+(.+)$', content, re.MULTILINE)
        title = title_match.group(1) if title_match else os.path.basename(file_path).replace('.mdx', '')
        
        # Generate description
        description = get_description_from_content(content, title)
        
        # Add frontmatter with title and description
        frontmatter = f'---\ntitle: "{title}"\ndescription: "{description}"\n---\n\n'
        new_content = frontmatter + content
        
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(new_content)
        
        print(f"✓ {file_path} - added frontmatter with description")
        return True

def main():
    """Process all MDX files"""
    root_dir = '/home/gul-tekin/docs-1'
    updated_count = 0
    
    # Process all MDX files
    for dirpath, dirnames, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename.endswith('.mdx'):
                file_path = os.path.join(dirpath, filename)
                if add_meta_description(file_path):
                    updated_count += 1
    
    print(f"\n✅ Updated {updated_count} files with meta descriptions")

if __name__ == '__main__':
    main()