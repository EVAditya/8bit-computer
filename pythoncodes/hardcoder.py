def memloader(readfile,writefile, start):
    try:
        # Open the file in read mode
        with open(readfile, 'r') as file1:
            with open(writefile,'w') as file2:
                # Read the entire file
                lines = file1.readlines()  # Changed from readline() to readlines()
                for i in range(0,start):
                    oneline = f"mem[{i}] <= 8'h00;\n"  # initializing the memory before start to zero
                    file2.writelines(oneline)
                for i in range(start,256):
                    game=lines[i-start].strip()
                    oneline = f"mem[{i}] <= 8'h{game};\n" if(game) else f"mem[{i}] <= 8'h00;\n"
                    file2.writelines(oneline)
    except Exception as e:
        print(f"An error occurred: {e}")


#Example usage
memloader('memory.list','copy.list',0)