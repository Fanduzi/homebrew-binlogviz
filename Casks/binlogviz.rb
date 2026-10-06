cask "binlogviz" do
  version "0.23.14"

  on_macos do
    on_intel do
      sha256 "1652af443354a91b86945160303d87e458b8cac18a2f5bc1e70701fdf25a4755"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.14/binlogviz_0.23.14_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "09b83ba0253a1b9a68b21f07b96caab0928a4d758faf994db27a61e97e3a9498"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.14/binlogviz_0.23.14_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "7549720dc18ef399336c7c2b5b87c9d182d244a61afcaceec0541bc4b70a37f4"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.14/binlogviz_0.23.14_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "aad01c5db948eabff7a8600657170d1b6d52940dcc02c12c50a9d4f178547312"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.14/binlogviz_0.23.14_linux_arm64.tar.gz",
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
