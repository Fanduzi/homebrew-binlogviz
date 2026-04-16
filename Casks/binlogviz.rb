cask "binlogviz" do
  version "0.18.0"

  on_macos do
    on_intel do
      sha256 "58d34aaa10ba5de07c153225e15b5e6aa878da1a28bf486418685c52294abb7d"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.18.0/binlogviz_0.18.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "10a8a6fce3b9d4abf5ee592dd13cd0867f60afb245f9e74a189fb8ce09db942e"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.18.0/binlogviz_0.18.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "1cf46301606878847566365735910548ca5ad5f14ce0d6e9447a6ad4f35d1459"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.18.0/binlogviz_0.18.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "c729cfcbcaf86f03491a7176584dd8d0baf32c6906f7cd4ab5f3eba3f571e0ab"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.18.0/binlogviz_0.18.0_linux_arm64.tar.gz",
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
