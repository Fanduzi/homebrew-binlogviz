cask "binlogviz" do
  version "0.32.0"

  on_macos do
    on_intel do
      sha256 "5028b736bb866bdef5d2de5a3bfa82efcacb6aa8d4d208625661f201e661ea30"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.32.0/binlogviz_0.32.0_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "6503787be3fba55ecf6fa6eabcb988ac553b043718d46d0e8fbbe696a6de9c5f"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.32.0/binlogviz_0.32.0_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "4e60fe4197df76a543cce346fa28344fa726a037ecff68e0f890993d0d267ad8"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.32.0/binlogviz_0.32.0_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "6fdb3fc1d7a177a2d709b46d59f7fe7c380a15b711e35a33a5fbbcc38d99c06d"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.32.0/binlogviz_0.32.0_linux_arm64.tar.gz",
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
