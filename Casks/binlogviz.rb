cask "binlogviz" do
  version "0.23.33"

  on_macos do
    on_intel do
      sha256 "3969e86043724f0c44550f39508ef054d5804b126db2ba209b7154050b32f982"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.33/binlogviz_0.23.33_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "97c425a36ab30268807100f7a34a786bbfed62c698ceb411b995acf794e2ad44"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.33/binlogviz_0.23.33_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "57770d9b236f823b1ee3ef23c44a36a1e1d120216972eee3e22b8aefe92eab6f"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.33/binlogviz_0.23.33_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "a0a9df4a06115290712b8c32c3c4710e0fb866269adba169eb42c760a8a4596c"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.33/binlogviz_0.23.33_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
